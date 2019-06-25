
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 23;
      string public election_name = "World Cup Awards";
      string public election_date = "2019-12-31";
      string public election_time = "12:59:00";
      int public election_duration = 1;
      uint public total_posts = 3;
      int public total_voters = 3;

      uint public candidatesCount = 0;
      uint public postsCount = 0;
      uint public votersCount = 0;
      
      //Model the candidate
      struct Candidate{
        uint cadidateId;  
        string name;
        uint voteCount;
        uint postId;
      }

      //Model the voter
      struct Voter{
        string name;
        string email;
        string public_key;
        uint[3] vote;
        bool hasVoted;
      }
      
      //Posts List
      string[] public posts;
      
      //Candidates List
      Candidate[] public candidates;

      //Voters List
      Voter[] public voters;
      
      function addPost(string memory _name) private {
        postsCount++;
        posts.push(_name);
      }
      
      function addCandidate(uint _candidate_id, string memory _name, uint _postId) private {
        candidatesCount++;
        Candidate memory c = Candidate(_candidate_id, _name , 0, _postId);
        candidates.push(c);
      }

      function addVoter(string memory _name, string memory _email, string memory _public_key) private {
        uint[3] memory votes;
        votersCount++;
        Voter memory v = Voter(_name , _email, _public_key, votes, false);
        voters.push(v);
      }

       function getPosts() public view returns(string[] memory){
        return posts;
      }

      function getCandidates() public view returns(Candidate[] memory){
        return candidates;
      }

      function getVoters() public view returns(Voter[] memory){
        return voters;
      }

      function castVote(uint postId, uint candidateId, uint voterId) public payable {
         
         if(voters[voterId].hasVoted == false){
          voters[voterId].vote[postId] = candidateId;
          candidates[candidateId].voteCount++;
          
          if(postId == (total_posts - 1)){
          voters[voterId].hasVoted = true;
          }
         }
      }

      constructor() public {

    addPost("Best Bowler");addCandidate(0,"Mitchell Starc",0);addCandidate(1,"Jofra Archer",0);addCandidate(2,"Muhammad Amir",0);addPost("Best Batsman");addCandidate(3,"David Warner",1);addCandidate(4,"Aron Finch",1);addCandidate(5,"Joe Root",1);addPost("Best Allrounder");addCandidate(6,"Ben Stoakes",2);addCandidate(7,"Chris Woakes",2);addCandidate(8,"Andre Russell",2);addVoter("Naveed","naveedraza2907@gmail.com","0X13AB9BE743BBBD271ED766FE20FC5C4ED8A64F4C");addVoter("Adil","adilsachwani@gmail.com","0X15FE5563292D04ED1D23E8F0B5D0A95B5A02D64B");addVoter("Areeba","naveedraza97@hotmail.com","0X4E763952427597DD056A0374AACAF7A51CDD5802");
        }
      }