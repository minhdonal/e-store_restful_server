import React, {PureComponent} from 'react';
import '../App.css';
import {Link } from 'react-router-dom';
import './css/style.css'
class Menu extends PureComponent{
  render(){
  return (
    <div className="silbarfixed"> 
     <ul className="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <Link to={'/'} className="sidebar-brand d-flex align-items-center justify-content-center">
        <div className="sidebar-brand-icon rotate-n-15">
          <i className="fas fa-laugh-wink"></i>
        </div>
        <div className="sidebar-brand-text mx-3">Chocola Store <sup>admin</sup></div>
      </Link>


      <hr className="sidebar-divider my-0"/>
      <li className="nav-item">
        <Link to={'/'} className="nav-link">
          <span>Dashboard</span></Link>
      </li>
      <li className="nav-item">
        <Link to={'/product'} className="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>Product</span>
        </Link>
       </li> 

      <li className="nav-item">
        <Link to={'/user'} className="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>User</span>
        </Link>
       </li>

      <li className="nav-item">
        <Link to={'/recommend'} className="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>Recomend</span>
        </Link>
       </li>
       <li className="nav-item">
        <Link to={'/datarecomend'} className="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>Data recommend</span>
        </Link>
       </li>
       <li className="nav-item">
        <Link to={'/order'} className="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <span>Order</span>
        </Link>
       </li>
    </ul>
   </div>
        
  );
}
}

export default Menu;
