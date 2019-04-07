
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 6;
      string public election_name = "Testing1";
      string public election_date = "2019-01-01";
      string public election_time = "14:00:00";
      int public election_duration = 1;
      string public election_secret_key = "";
      int public total_posts = 2;
      int public total_voters = 3;

      uint public candidatesCount = 0;
      uint public postsCount = 0;
      uint public votersCount = 0;
      
      //Model the candidate
      struct Candidate{
        string name;
        uint voteCount;
        uint postId;
      }

      //Model the voter
      struct Voter{
        string name;
        string email;
        string public_key;
        bool vote;
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
      
      function addCandidate(string memory _name, uint _postId) private {
        candidatesCount++;
        Candidate memory c = Candidate(_name , 0, _postId);
        candidates.push(c);
      }

      function addVoter(string memory _name, string memory _email, string memory _public_key) private {
        votersCount++;
        Voter memory v = Voter(_name , _email, _public_key, false);
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

      constructor() public {

    addPost("President");addCandidate("Obaid",0);addCandidate("khurram",0);addPost("President");addCandidate("Obaid",1);addCandidate("khurram",1);addPost("Vice President");addCandidate("adil",2);addCandidate("naveed",2);addPost("Vice President");addCandidate("adil",3);addCandidate("naveed",3);addVoter("naveed","n2@g.com","123");addVoter("adil","n1@g.com","123");addVoter("obaid","n@g.com","123");
        }
      }