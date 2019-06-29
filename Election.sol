
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 31;
      string public election_name = "Filmfare";
      string public election_date = "2019-12-30";
      string public election_time = "13:00:00";
      int public election_duration = 9;
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

    addPost("Film");addCandidate(0,"Shawshank Redemption",0);addCandidate(1,"Avengers Endgame",0);addCandidate(2,"Wolf of the Wall Street",0);addCandidate(3,"Titanic",0);addCandidate(4,"Thor Ragnarok",0);addPost("Actor");addCandidate(5,"Tom Holland",1);addCandidate(6,"Al Pacino",1);addCandidate(7,"Leonardo DeCaprio",1);addPost("Actress");addCandidate(8,"Scarlet Johanson",2);addCandidate(9,"Angelina Julie",2);addCandidate(10,"Elizabeth Oleson",2);addVoter("Adil Aslam","adilsachwani@gmail.com","0X70A47E1BE460464BE8DC17F2FDEEF2DC306F274D");addVoter("Naveed Raza","naveedraza2907@gmail.com","0X3D1723387A7384C98ABFD42666568F2A3CF3C4E7");addVoter("Areeba Shoaib","adilsachwani@yahoo.com","0X4F63FA99269BDD3B43E4C8CDB036399A6F0E69DF");
        }
      }