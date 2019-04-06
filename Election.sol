
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 7;
      string public election_name = "Naveed Testing ";
      string public election_date = "2019-12-30";
      string public election_time = "00:00:00";
      int public election_duration = 1;
      string public election_secret_key = "shsgndnsfbsnkn3k4bb4jcsm_ndhh3&9n-4ncbb";
      int public total_posts = 2;
      int public total_voters = 5;

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

      constructor() public {

    addPost("chairman");addCandidate("naveed",0);addCandidate("naveeda",0);addPost("vice chairman");addCandidate("adil",1);addCandidate("adila",1);addVoter("n","n2@g.com","123");addVoter("a","n1@g.com","123");addVoter("v","n@g.com","123");addVoter("e","n@g.com","123");addVoter("d","n@g.com","123");addVoter("n","n2@g.com","123");addVoter("a","n1@g.com","123");addVoter("v","n@g.com","123");addVoter("e","n@g.com","123");addVoter("d","n@g.com","123");addVoter("n","n2@g.com","123");addVoter("a","n1@g.com","123");addVoter("v","n@g.com","123");addVoter("e","n@g.com","123");addVoter("d","n@g.com","123");addVoter("","","");addVoter("","","");addVoter("","","");addVoter("","","");addVoter("","","");addVoter("naveed","n2@g.com","123");addVoter("naveedd","n1@g.com","123");addVoter("naveeddd","n@g.com","123789");addVoter("e","n@g.com","123");addVoter("d","n@g.com","123");
        }
      }