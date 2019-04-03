
    pragma solidity >=0.4.22 <0.6.0;
    contract Election {
      
      uint public election_id = 3;
      string public election_name = "ACM Executive Body";
      string public election_date = "2018-01-01";
      string public election_time = "10:10:00";
      int public election_duration = 4;
      string public election_secret_key = "shsgndnsfbsnkn3k4bb4jcsm_ndhh3&9n-4ncbb";
      int public total_posts = 3;
      int public total_voters = 2;

      uint public candidatesCount = 0;
      uint public postsCount = 0;
      
      //Model the candidate
      struct Candidate{
          string name;
          uint voteCount;
          uint postId;
      }
      
      //Posts List
      string[] public posts;
      
      //Candidates List
      Candidate[] public candidates;
      
      function addPost(string memory _name) private {
          postsCount++;
          posts.push(_name);
      }
      
      function addCandidate(string memory _name, uint _postId) private {
          candidatesCount++;
          Candidate memory c = Candidate(_name , 0, _postId);
          candidates.push(c);
      }
      
      constructor() public {

    addPost("President");addCandidate("Usman",0);addCandidate("Naveed",0);addPost("Vice President");addCandidate("Haiqa",1);addCandidate("Areeba",1);addPost("Web Master");addCandidate("Adil",2);
        }
      }