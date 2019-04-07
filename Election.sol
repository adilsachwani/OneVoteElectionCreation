
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 11;
      string public election_name = "General Elections 2018";
      string public election_date = "2019-11-26";
      string public election_time = "12:59:00";
      int public election_duration = 4;
      int public total_posts = 1;
      int public total_voters = 1;

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

    addPost("shhsh");addCandidate("hdhdhdh",0);addCandidate("hdhdhdh",0);addCandidate("hdhdhdh",0);addCandidate("hdhdhdh",0);addCandidate("jdd",0);addCandidate("djdj",0);addCandidate("ndnd",0);addCandidate("ndnd",0);addVoter("jjd","DNNDN","NDNND");addVoter("jjd","DNNDN","NDNND");addVoter("jjd","DNNDN","NDNND");
        }
      }