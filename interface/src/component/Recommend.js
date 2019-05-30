import React, {PureComponent} from "react"
import Table from './Table';
class Recommend extends PureComponent {
	constructor(props){
		super(props);
		this.state={
			table: []
		}
	}
	componentDidMount(){
		this.getData();

	}
	getData(){
		let url = '/api/recomendall';
		let options = {
			method: 'GET'
		};
		fetch(url,options)
		.then(res=>res.json())
		.then(res=>
		{
			if(res.rules)
			{
				let tempdata = [];
				res.rules.map((record,index)=>
					tempdata.push(
						<tr key={index}>
						<td key={'i'+index}> {index+1} </td>
						<td key={"tdf"+index}>
						{record.fist.map((item,i) => (
							<div key={i}>{item}</div>
							))}
						</td>
						<td key={"tdn"+index}>
						{record.next.map((item,i) => (
							<div key={i}>{item}</div>
							))}
						</td>
						</tr>
						)
					)
				this.setState({table:tempdata})}
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
			<th key={'th0'}>No</th>
			<th key={'th1'}>Product</th>
			<th key={'th2'}>Recommend Product</th>
			</tr>
			);
			return theads;
		}
		render(){
			let theads = this.writeThead();
			return(
			<div>
			<Table 
			thead = {theads}
			table = {this.state.table}/>
			</div>
			)
		}
	}

	export default Recommend;
