import React, {PureComponent} from "react"
import Table from './Table';
import {Modal, Button} from "react-bootstrap";
import './css/style.css'
class Product extends PureComponent {
	constructor(props){
		super(props);
		this.state={
			table: [],
			show: false,
			category:2,
			active: 1,
			name: null,
			description: null,
			img_url: null,
			quantity: null,
			discount: null
		}
	this.handleShow = this.handleShow.bind(this);
	this.handleChange=this.handleChange.bind(this);
    this.handleClose = this.handleClose.bind(this);
    this.postData = this.postData.bind(this);
	}
	componentDidMount(){
		this.getData();

	}
	setCategory(id_category) {
		switch(id_category){
			case 2:
				return "Đồ uống";
				case 3:
				return "Mỹ phẩm";
				case 4:
				return "Bánh kẹo";
				case 5:
				return "Trái cây"
			default:
				return 'undefined';
		}	
	}

	handleChange(event) {
		const value= event.target.value;
		const name= event.target.name;
		this.setState({[name]: value});
			
		}
	getData(){
		let url = '/api/products';
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
                       <td key={index+'td7'}>{records.name} </td>
                      <td key={index+'td2'}>{this.setCategory(records.categ_id)} </td>
                      <td key={index+'td3'}>{records.description} </td>
                      <td key={index+'td4'}>{records.img_url} </td>
                      <td key={index+'td5'}>{records.regular_price} </td>
                      <td key={index+'td6'}>{records.quantity} </td>
                      <td key={index+'td8'}>{records.discount_price} </td>
                      <td key={index+'td9'}>{records.inserted_at} </td>
                      </tr>))
					this.setState({table:tempdata})}
			}
			)
			.catch(e=>{
				console.log(e);
			});   
	}
		postData(){
		let url = '/api/products';
		let formdata = new FormData();
		formdata.append("name", this.state.name);
		formdata.append("img_url", this.state.img_url);
		formdata.append("description", this.state.description);
		formdata.append("categ_id", this.state.category);
		formdata.append("status", this.state.active);
		formdata.append("price", this.state.price);
		formdata.append("discount", this.state.discount);
		formdata.append("quantity", this.state.quantity);
		let options = {
				method: 'POST',
				body: formdata
			};
		fetch(url,options)
			.then(res=>res.json())
			.then(res=>
			{
				if(res.status==='success')
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
			});   
	}
	writeThead(){
		let theads = []
		theads.push(
			<tr key={'tr1'}>
			<th key={'th1'}>Id Product</th>
			<th key={'th2'}>Name</th>
			<th key={'th3'}>Category</th>
			<th key={'th4'}>Description</th>
			<th key={'th5'}>Img url</th>
			<th key={'th6'}>Regular price</th>
			<th key={'th7'}>Quantity</th>
			<th key={'th8'}>Discount price</th>
			<th key={'th9'}>Inserted at</th>
			</tr>
			);
		return theads;
	}
	handleClose() {
    this.setState({ show: false });
  }

  handleShow() {
    this.setState({ show: true });
  }
	render(){
		let theads = this.writeThead();
		return(
			<div>
			<div className = "containBtn">
			<div className="btnBlue"
			onClick={this.handleShow}>
			Import Product
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
          	name="name"
          	className="textModel" 
          	placeholder="product name"
          	onChange={this.handleChange}/>

          	<input type="text" 
          	name="description"
          	className="textModel" 
          	placeholder="product description"
          	onChange={this.handleChange}/>

          	<input type="text" 
          	name="img_url"
          	className="textModel" 
          	placeholder="product img url"
          	onChange={this.handleChange}/>

          	<select name='category'
          	className="optionModel"
          	value={this.state.category}
          	onChange={this.handleChange}>
          	<option value='2' key='2'>Đồ uống</option>
          	<option value='3' key='3'>Mỹ phẩm</option>
          	<option value='4' key='4'>Bánh kẹo</option>
          	<option value='5' key='5'>Trái cây</option>
          	</select>

          	<select name='active'
          	className="optionModel"
          	value={this.state.active}
          	onChange={this.handleChange}>
          	<option value='1' key='1'>Active</option>
          	<option value='0' key='2'>Unactive</option>
          	</select>

          	<input type="number" 
          	name="price"
          	className="textModel" 
          	placeholder="product price"
          	onChange={this.handleChange}/>

          	<input type="number" 
          	name="quantity"
          	className="textModel" 
          	placeholder="product quantity"
          	onChange={this.handleChange}/>

          	<input type="number" 
          	name="discount"
          	className="textModel" 
          	placeholder="discount price"
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
