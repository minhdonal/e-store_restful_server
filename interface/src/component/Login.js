import React, {PureComponent} from "react"
import '../App.css';

class Login extends PureComponent{
  constructor(props){
    super(props);
    this.state={
      username:'',
      password:''
    }
    this.handleChange=this.handleChange.bind(this);
    this.postData=this.postData.bind(this);
  }
  handleChange(event) {
    const value= event.target.value;
    const name= event.target.name;
    this.setState({[name]: value});
      
    }
   postData(){
    let url = '/api/account';
    let formdata = new FormData();
    formdata.append("email", this.state.username);
    formdata.append("password", this.state.password);
   
    let options = {
        method: 'POST',
        body: formdata
      };
    fetch(url,options)
      .then(res=>res.json())
      .then(res=>
      {
        if(res.role==='admin')
        {
          localStorage.setItem('Auth',res.id_user);
          window.location.href="/";
        }
        else {
          alert('Login faill');
          this.setState({username:'',password:''})
        }
      }
      )
      .catch(e=>{
        console.log(e);
      });   
  }
render(){
  return (
            <div className="container">

    <div className="row justify-content-center">

      <div className="col-xl-10 col-lg-12 col-md-9">

        <div className="card o-hidden border-0 shadow-lg my-5">
          <div className="card-body p-0">
            <div className="row">
              <div className="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div className="col-lg-6">
                <div className="p-5">
                  <div className="text-center">
                    <h1 className="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form className="user">
                    <div className="form-group">
                      <input type="email" className="form-control form-control-user" id="exampleInputEmail" 
                      aria-describedby="emailHelp" placeholder="Enter Email Address..."
                      name="username"
                      onChange={this.handleChange}/>
                    </div>
                    <div className="form-group">
                      <input type="password" className="form-control form-control-user"
                       id="exampleInputPassword" placeholder="Password"
                       name="password"
                       onChange={this.handleChange}/>
                    </div>
                    <div  className="btn btn-primary btn-user btn-block cusorPoint"
                    onClick={this.postData}>
                      Login
                    </div>
                    <hr/>
                  </form>
                  <hr/>
                  <div className="text-center">
                    <a className="small" href="forgot-password.html">Forgot Password?</a>
                  </div>
                  <div className="text-center">
                    <a className="small" href="register.html">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  );
}
}

export default Login;
