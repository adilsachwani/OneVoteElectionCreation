// Deploy election contract
       app.get('/deploy_contract/:election_id', (request, response) => {

        const election_id = request.params.election_id;

        const input = fs.readFileSync('C:/xampp/htdocs/onevote/Election.sol');
        const output = solc.compile(input.toString(), 1);
        const bytecode = output.contracts[':Election'].bytecode;

        let buildTransactionPromise = new Promise((resolve, reject) =>{

            web3.eth.getTransactionCount(accountAddress, (err, txCount) => {

                if(error){
                    
                    reject(err);
                
                } else {

                    //build the transaction
                    const txObject = {
                        nonce : web3.utils.toHex(txCount),
                        data : '0x' + bytecode,
                        gasLimit : web3.utils.toHex(1000000000),
                        gasPrice : web3.utils.toHex(web3.utils.toWei('10', 'gwei'))
                    }

                    resolve(txObject);

                }
                
            });

        });

        buildTransactionPromise.then()

       

            //Sign the transaction
            const tx = new Tx(txObject);
            tx.sign(privateKey);

            const serializedTransaction = tx.serialize();
            const raw = '0x' + serializedTransaction.toString('hex');

            //Broadcast the address
            web3.eth.sendSignedTransaction(raw, (err, txHash) =>{

                web3.eth.getTransactionReceipt(txHash, (err, receipt) => {

                    var query = "SELECT voter_email FROM voter WHERE election_id = ?"; 

                    pool.query(query, election_id, (error, result) => {

                        if(error){
                            
                            console.log(error);
                            
                        } else{

                            var emails = "";

                            for(var i=0 ; i<result.length; i++){

                                if(i != result.length-1){
                                    
                                    emails += result[i]['voter_email'] + ",";
                                
                                } else {
                                    
                                    emails += result[i]['voter_email'];
                                
                                }
                                
                            }

                            const mailOptions = {
                                
                                from: 'adilsachwani@gmail.com',
                                to: emails,
                                subject: 'OneVote Election Details',
                                html: 
                                
                                '<p>Dear Voter,</p>' +
                                '<p>You have been registered for voting in <b>General Elections 2019</b> on 12th May, 2019 at 12:00am .</p>' +
                                '<p>Transaction Hash is <b>' + receipt.transactionHash + '</b></p>' +
                                '<p>You can cast your vote through OneVote Webpage which is completely secured thorugh Blockchain: http://www.localhost/onevotehome</p>' +
                                '<footer>' +
                                    '<div>' +
                                        '<a target="_blank" href="http://www.localhost/onevotehome">' +
                                            '<img src="http://neditec.org.pk/images/onevote_logo.png" style="width:100%;" border="0" alt="Null">' +
                                        '</a>' +
                                    '</div>' +
                                '</footer>'
                            
                            };

                            transporter.sendMail(mailOptions, function (err, info) {
                        
                                if (err) {
                                    console.log("Hello");
                                } else {
                                    console.log('Email sent: ' + info.response);
                                }
                             });

                             response.send({
                                transaction_hash : receipt.transactionHash,
                                contract_address : receipt.contractAddress,
                                block_number : receipt.blockNumber,
                                gas_used: receipt.gasUsed
                            });

                        }
            
                    });
                
                }).catch( (err) =>{
                    console.log(err);
                });

            }).catch( (err) =>{
                console.log(err);
            });
        
        }).catch( (err) =>{
            console.log(err);
        });
    
    });