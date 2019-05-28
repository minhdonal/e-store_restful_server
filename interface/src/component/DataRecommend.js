import React, {PureComponent} from "react"
import Table from './Table';
import {Modal, Button} from "react-bootstrap";
class Product extends PureComponent {
	constructor(props){
		super(props);
		this.state={
			table: [],
			page: 0,
			show:false,
			minlen: 4,
			minconf:0.04,
			runalgorithm: 'displayNone'
		}
		this.handleShow = this.handleShow.bind(this);
		this.handleChange=this.handleChange.bind(this);
		this.handleClose = this.handleClose.bind(this);
		this.postData = this.postData.bind(this);
	}
	componentDidMount(){
		this.getData();

	}
	handleChange(event) {
		const value= event.target.value;
		const name= event.target.name;
		this.setState({[name]: value});

	}
	getData(){
		let roots = '/api/datarecomend';
		let page = '?page='+this.state.page;
		let url = roots + page;
		let options = {
			method: 'GET'
		};
		fetch(url,options)
		.then(res=>res.json())
		.then(res=>
		{
			if(res.status==="success")
			{
				let tempdata = [];
				res.data.map((records,index)=>
					tempdata.push(<tr key={index}>
					{
						records.map((item,i)=>
							<td key={i+'td'}>{item} </td>
							)
					}

					</tr>))
				this.setState({table:tempdata})}
			}
			)
		.catch(e=>{
			console.log(e);
		});   
	}
	postData(){
		this.setState({runalgorithm:'displayBlock'});
		let roots = '/api/algorthm';
		let minLen = '?minlen='+this.state.minlen;
		let minConf = '&minconf='+this.state.minconf;
		let url = roots + minLen + minConf;
		let options = {
			method: 'GET'
		};
		fetch(url,options)
		.then(res=>res.json())
		.then(res=>
		{

			if(res.status==='success')
			{
				this.setState({show:false});
				window.location.href="/recommend";
			}
			else {
				alert('Import faill');
			}
		}
		)
		.catch(e=>{
			console.log(e);
		});   

	}
	handleShow() {
		this.setState({ show: true });
	}
	handleClose() {
		this.setState({ show: false });
	}
	render(){
		return(
			<div>
			<div className = "containBtn">
			<div className="btnBlue"
			onClick={this.handleShow}>
			Run algorithm
			</div>
			</div>
			<Table 
			table = {this.state.table}/>
			<Modal show={this.state.show} onHide={this.handleClose}>
			<Modal.Header closeButton>
			<Modal.Title>Import new product</Modal.Title>
			</Modal.Header>
			<Modal.Body>
			<div className="containText">
			<input type="number" 
			name="minlen"
			className="textModel" 
			placeholder="minlen"
			value={this.state.minlen}
			onChange={this.handleChange}/>

			<input type="number" 
			name="minconf"
			className="textModel" 
			placeholder="minconf"
			value={this.state.minconf}
			onChange={this.handleChange}/>
			<div className={"btn btn-light btn-icon-split " +this.state.runalgorithm}
			key='aLink'>
			<span className="icon text-gray-600">
			<i className="fas fa-arrow-right"></i>
			</span>
			<span className="text">Wait a moment, the algorithm is running</span>
			</div>


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
