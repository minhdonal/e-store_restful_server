import React, {PureComponent} from "react"
import Table from './Table';
import {Modal, Button} from "react-bootstrap";
class Product extends PureComponent {
	constructor(props){
		super(props);
		this.state={
			table: [],
			show: false,
			email:'',
			password:'',
			first_name:'',
			last_name:'',
			adress:'',
			phone:'',
			ConfirmPassword:''
		}
		this.handleShow = this.handleShow.bind(this);
	this.handleChange=this.handleChange.bind(this);
    this.handleClose = this.handleClose.bind(this);
    this.postData = this.postData.bind(this);
	}
	componentDidMount(){
		this.getData();

	}
	postData(){
		if(this.state.password === this.state.ConfirmPassword)
		{let url = '/api/signup';
				let formdata = new FormData();
				formdata.append("email", this.state.email);
				formdata.append("password", this.state.password);
				formdata.append("fisrtname", this.state.first_name);
				formdata.append("lastname", this.state.last_name);
				formdata.append("adress", this.state.adress);
				formdata.append("phone", this.state.phone);
				let options = {
						method: 'POST',
						body: formdata
					};
				fetch(url,options)
					.then(res=>res.json())
					.then(res=>
					{
						if(res.status==='SUCCESS')
						{
							this.setState({show:false});
							alert('Import success');
						}
						else {
							alert('Import faill');
						}
					}
					)
					.catch(e=>{
						console.log(e);
					});   }
				else {
					alert('password not confirm');
				}
	}
	getData(){
		let url = '/api/accounts';
		let options = {
				method: 'GET'
			};
		fetch(url,options)
			.then(res=>res.json())
			.then(res=>
			{
				if(res)
				{
					let tempdata = [];
					res.map((records,index)=>
							tempdata.push(<tr key={index}>
	                      <td key={index+'td1'}>{records.id} </td>
	                       <td key={index+'td7'}>{records.email} </td>
	                      <td key={index+'td2'}>{records.first_name} </td>
                      <td key={index+'td3'}>{records.last_name} </td>
                      <td key={index+'td4'}>{records.role} </td>
                      <td key={index+'td5'}>{records.phone} </td>
                      <td key={index+'td6'}>{records.adress} </td>
                      </tr>))
					this.setState({table:tempdata})}
			}
			)
			.catch(e=>{
				console.log(e);
			});   
	}
		handleChange(event) {
		const value= event.target.value;
		const name= event.target.name;
		this.setState({[name]: value});
			
		}
		handleShow() {
    this.setState({ show: true });
  }
  	handleClose() {
    this.setState({ show: false });
  }
	writeThead(){
		let theads = []
		theads.push(
			<tr key={'tr1'}>
			<th key={'th1'}>Id User</th>
			<th key={'th2'}>Email</th>
			<th key={'th3'}>First Name</th>
			<th key={'th4'}>Last Name</th>
			<th key={'th5'}>Role</th>
			<th key={'th6'}>Phone</th>
			<th key={'th7'}>Adress</th>
			</tr>
			);
		return theads;
	}
	render(){
		let theads = this.writeThead();
		return(
			<div>
			<div className = "containBtn">
			<div className="btnBlue"
			onClick={this.handleShow}>
			Import User
			</div>
			</div>
			<Table 
			thead = {theads}
			table = {this.state.table}/>
			<Modal show={this.state.show} onHide={this.handleClose}>
          <Modal.Header closeButton>
            <Modal.Title>Import new product</Modal.Title>
          </Modal.Header>
          <Modal.Body>
          <div className="containText">
          	<input type="text" 
          	name="email"
          	className="textModel" 
          	placeholder="email"
          	onChange={this.handleChange}/>

          	<input type="password" 
          	name="password"
          	className="textModel" 
          	placeholder="password"
          	onChange={this.handleChange}/>


          	<input type="password" 
          	name="ConfirmPassword"
          	className="textModel" 
          	placeholder="Confirm password"
          	onChange={this.handleChange}/>

          	<input type="text" 
          	name="first_name"
          	className="textModel" 
          	placeholder="first name"
          	onChange={this.handleChange}/>

          	<input type="text" 
          	name="last_name"
          	className="textModel" 
          	placeholder="last name"
          	onChange={this.handleChange}/>
          	
          	<input type="text" 
          	name="adress"
          	className="textModel" 
          	placeholder="adress"
          	onChange={this.handleChange}/>

          	<input type="number" 
          	name="phone"
          	className="textModel" 
          	placeholder="phone"
          	onChange={this.handleChange}/>

          	</div>
          </Modal.Body>
          <Modal.Footer>
          <Button variant="secondary" onClick={this.handleClose}>
              Close
            </Button>
            <Button variant="primary" onClick={this.postData}>
              Save Changes
            </Button>
          </Modal.Footer>
        </Modal>
			</div>
			)
	}
}

export default Product;
