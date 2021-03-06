import React from 'react';
import { Link } from 'react-router-dom';

const NavBar = () => {
  return (
    <nav style={{width : "100%" , display: "flex" ,  justifyContent: "space-around" , backgroundColor: "black"}}>
      <div>
        <Link to='/admin'>admin-CICD</Link>
      </div>

      <div>
        <Link to='/home'>home-CICD</Link>
      </div>

      <div>
        <Link to='/stats'>stats-CICD</Link>
      </div>
    </nav>
  );
};

export default NavBar;
