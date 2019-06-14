
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 19;
      string public election_name = "Friends";
      string public election_date = "2019-01-01";
      string public election_time = "01:00:00";
      int public election_duration = 1;
      uint public total_posts = 2;
      int public total_voters = 2;

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
        uint[2] vote;
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
        uint[2] memory votes;
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

    addPost("Best Male Actor");addCandidate(0,"Chandellar",0);addCandidate(1,"Joey",0);addCandidate(2,"Ross",0);addPost("Best Female Actor");addCandidate(3,"Monica",1);addCandidate(4,"Rachelle",1);addCandidate(5,"Pheboe",1);addVoter("Naveed","naveedraza2907@gmail.com","0x13AB9be743BBBd271Ed766Fe20fc5c4Ed8a64F4C");addVoter("adil","adilsachwani@gmail.com","0x15FE5563292d04eD1d23E8F0B5D0a95b5a02d64b");
        }
      }