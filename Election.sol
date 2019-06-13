
    pragma solidity >=0.4.22 <0.6.0;
    pragma experimental ABIEncoderV2;
    
    contract Election {
      
      uint public election_id = 22;
      string public election_name = "Avengers";
      string public election_date = "2018-11-30";
      string public election_time = "00:58:00";
      int public election_duration = 10;
      int public total_posts = 3;
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
        uint[3] vote;
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
        Voter memory v = Voter(_name , _email, _public_key, votes);
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

    addPost("Best Film");addCandidate(0,"Iron Man 1",0);addCandidate(1,"Spider Man Homecoming",0);addCandidate(2,"Thor Ragnarok",0);addPost("Best Avenger");addCandidate(3,"Thor",1);addCandidate(4,"Captain Marvel",1);addCandidate(5,"Iron Man",1);addCandidate(6,"The Hawkeye",1);addPost("Most Powerful");addCandidate(7,"Thor",2);addCandidate(8,"Scarlet Witch",2);addCandidate(9,"Vision",2);addVoter("Amna Ahmed","amna@live.com","0x70a47E1Be460464bE8Dc17F2FDEEf2dC306f274d");addVoter("Rija Asif","rija@live.com","0x3D1723387A7384C98aBFd42666568F2A3Cf3C4e7");
        }
      }