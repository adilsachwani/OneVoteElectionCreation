
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 16;
      string public election_name = "General Elections 2019";
      string public election_date = "2019-12-12";
      string public election_time = "12:30:00";
      int public election_duration = 12;
      int public total_posts = 3;
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

      function getCandidates() public view returns(Candidate[] memory){
        return candidates;
      }

      function getVoters() public view returns(Voter[] memory){
        return voters;
      }

      constructor() public {

    addPost("Prime Minister");addCandidate("Imran Khan",0);addCandidate("Nawaz Sharif",0);addCandidate("Bilawal Bhutto",0);addPost("President");addCandidate("Arif Alvi",1);addCandidate("Atizaz Ahsan",1);addPost("Finance Minister");addCandidate("Isaq",2);addCandidate("Asad Umar",2);addVoter("Adil Aslam","adilsachwani@gmail.com","jabsbshbdhsbdshbdshdbhsb");addVoter("Naveed Raza","naveed@live.com","sjhdhjssjdsndjsdnjdjsnsdjns");addVoter("Areeba Shoaib","areeba@live.com","hsgshdbsdshdbshdbshdbshdb");addVoter("Rija Asif Butt","rija@live.com","jadjbhhdajndjdbjdbdbdddjbdb");addVoter("Amna Habibi","amna@yahoo.com","jsjdbsdjbsdjbsdjbsjfhjffbfbffbfjjf");
        }
      }