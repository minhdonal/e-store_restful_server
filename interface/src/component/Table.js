import React, {PureComponent} from "react"
import '../App.css';
class Table extends PureComponent {
  constructor(props){
    super(props);
    this.state={
      searchKey:''
    }
    this.handleChange=this.handleChange.bind(this);
  }
  searchHandle(){
    

  }
  handleChange(event) {
    const value= event.target.value;
    this.setState({searchKey: value});
      
    }
  render(){
  return (
    <div className="container-fluid">
    <br/>
    <br/>
          <h1 className="h3 mb-2 text-gray-800">Tables</h1>
          <p className="mb-4"></p>
          <div className="card shadow mb-4">
            <div className="card-header py-3">
              <h6 className="m-0 font-weight-bold text-primary">DataTables</h6>
            </div>
            <div className="card-body">
            <div className="containSearch">
            <div className="input-group">
              <input type="text" className="form-control bg-light border-0 small" 
              placeholder="Search for..." 
              aria-label="Search" aria-describedby="basic-addon2"
              onChange={this.handleChange}
              />
              <div className="input-group-append">
                <button className="btn btn-primary" type="button">
                  <i className="fas fa-search fa-sm"></i>
                </button>
              </div>
              </div>
            </div>
              <div className="table-responsive">
                <table className="table table-bordered" id="dataTable" width="100%" cellSpacing="0">
                <thead>
                {this.props.thead}
                 </thead> 
                  <tbody>
                    {
                      this.props.table ?
                      this.props.table: <tr></tr>}
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
  );
}}

export default Table;
