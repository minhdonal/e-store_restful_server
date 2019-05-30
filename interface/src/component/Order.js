import React, {PureComponent} from "react"
import Table from './Table';
class Order extends PureComponent {
	constructor(props){
		super(props);
		this.state={
			tableSaleOrder: [],
			tableOrderLine: []

		}
	}
	componentDidMount(){
		this.getSaleOrderData();
		this.getOrderLineData()
	}
	getSaleOrderData(){
		let url = '/api/saleorder';
		let options = {
				method: 'GET'
			};
		fetch(url,options)
			.then(res=>res.json())
			.then(res=>
			{
				if(res.data)
				{
					let tempdata = [];
					res.data.map((records,index)=>
						tempdata.push(<tr key={index}>
                      <td key={index+'td1'}>{records.id} </td>
                      <td key={index+'td2'}>{records.user_id} </td>
                      <td key={index+'td3'}>{records.total} </td>
                      <td key={index+'td4'}>{records.inserted_at} </td>
                      </tr>))
					this.setState({tableSaleOrder:tempdata})}
			}
			)
			.catch(e=>{
				console.log(e);
			});   
	}
	getOrderLineData(){
		let url = '/api/orderline';
		let options = {
				method: 'GET'
			};
		fetch(url,options)
			.then(res=>res.json())
			.then(res=>
			{
				if(res.data)
				{
					let tempdata = [];
					res.data.map((records,index)=>
						tempdata.push(<tr key={index}>
                      <td key={index+'td1'}>{records.id} </td>
                      <td key={index+'td2'}>{records.order_id} </td>
                      <td key={index+'td3'}>{records.product_id} </td>
                      <td key={index+'td4'}>{records.subtotal} </td>
                      <td key={index+'td5'}>{records.inserted_at} </td>
                      </tr>))
					this.setState({tableOrderLine:tempdata})}
			}
			)
			.catch(e=>{
				console.log(e);
			});   
	}

	writeTheadSaleOrder(){
		let theads = []
		theads.push(
			<tr key={'tr1'}>
			<th key={'th1'}>Id Order</th>
			<th key={'th2'}>User Id</th>
			<th key={'th3'}>Total</th>
			<th key={'th4'}>Inserted at</th>
			</tr>
			);
		return theads;
	}
	writeTheadOrderLine(){
		let theads = []
		theads.push(
			<tr key={'tr1'}>
			<th key={'th5'}>Id</th>
			<th key={'th1'}>Id Order</th>
			<th key={'th2'}>Product Id</th>
			<th key={'th3'}>Subtotal</th>
			<th key={'th4'}>Inserted at</th>
			</tr>
			);
		return theads;
	}
	render(){
		let theadSaleOrder = this.writeTheadSaleOrder();
		let theadOrderLine = this.writeTheadOrderLine();
		return(
			<div>
			<Table 
			thead = {theadSaleOrder}
			table = {this.state.tableSaleOrder}/>
			<Table 
			thead = {theadOrderLine}
			table = {this.state.tableOrderLine}/>
			</div>
			)
	}
}

export default Order;
