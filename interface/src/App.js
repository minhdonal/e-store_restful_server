import React, { PureComponent, Suspense } from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import './App.css';
import './component/css/style.css';
import Login from './component/Login';
import Menu from './component/Menu';
import Order from './component/Order';
import Product from './component/Product';
import Recommend from './component/Recommend';
import Account from './component/Account';
import DataRecommend from './component/DataRecommend';
class App extends PureComponent {
  render(){
    let checkLogin = localStorage.getItem('Auth') === null?
    true : false;
    console.log('checkLogin',checkLogin);
    console.log(localStorage.getItem('Auth'));
  return (
    <div>
    {checkLogin ? <Login /> :(
    <Router>
    <Suspense fallback = {'Loading...'}>
      <Menu />
      <div className="containDB">
      <Switch>
      <Route exact path='/' render={()=><Product/>} />
      <Route exact path='/Login' render={()=><Login/>} />
      <Route exact path='/product' render={()=><Product/>} />
      <Route exact path='/order' render={()=><Order/>} />
      <Route exact path='/recommend' render={()=><Recommend/>} />
      <Route exact path='/user' render={()=><Account/>} />
      <Route exact path='/datarecomend' render={()=><DataRecommend/>} />
      </Switch>
      </div>
      </Suspense>
    </Router>)
  }
    </div>
  )
}
}
export default App;
