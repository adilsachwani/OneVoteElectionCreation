
    pragma solidity >=0.4.22 <0.6.0;
    
    contract Election {
      
      uint public election_id = 5;
      string public election_name = "NED Academy Elections";
      string public election_date = "2018-01-02";
      string public election_time = "23:58:00";
      int public election_duration = 12;
      string public election_secret_key = "shsgndnsfbsnkn3k4bb4jcsm_ndhh3&9n-4ncbb";
      int public total_posts = 2;
      int public total_voters = 2;

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

      constructor() public {

    addPost("President");addCandidate("Amna",0);addCandidate("Rija",0);addPost("Vice President");addCandidate("Surman",1);addVoter("Naveed","naveed@gmail.com","jjsuihsdkksdksdnk");addVoter("Adil","adil@gmail.com","ldsjknfnksnfsnksfnksnfs");addVoter("Naveed","naveed@gmail.com","jjsuihsdkksdksdnk");addVoter("Adil","adil@gmail.com","ldsjknfnksnfsnksfnksnfs");addVoter("Naveed","naveed@gmail.com","jjsuihsdkksdksdnk");addVoter("Adil","adil@gmail.com","ldsjknfnksnfsnksfnksnfs");addVoter("Naveed","naveed@gmail.com","jjsuihsdkksdksdnk");addVoter("Adil","adil@gmail.com","ldsjknfnksnfsnksfnksnfs");addVoter("","","");addVoter("","","");addVoter("Adil","adilsachwani@gmail.com","13dfsfsfsffs");addVoter("Amna","naveed@live.com","hdsjdjnskdsm");
        }
      }