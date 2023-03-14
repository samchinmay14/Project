import {Link, Outlet} from 'react-router-dom';
import {Container , DropdownButton, Dropdown} from 'react-bootstrap';
import {useState, useImperativeHandle} from 'react';
import logo2 from '../logo2.svg';
import logo from '../images/logo.jpg';
 
function CustomerHome()
{
  const [flag,changeFlag]=useState(false);
  const [Data,setData]=useState([]);
  const [message,setMessage]=useState("");
  const [f,changeF]=useState(false);


  const handlecurrnt=(e)=>{
    fetch("http://localhost:8080/services?category="+e)
    .then(resp=>{
        if(resp.ok)
            return resp.text();
        else
            throw new Error("Server error");
    })
    .then(text=>text.length ? JSON.parse(text):{})
    .then(obj=>{
        if(Object.keys(obj).length===0)
        {
           setMessage("No Services Available");
        }
        else{

            setData(obj);
            changeFlag(true);  
        }
    })
    .catch((error)=>{alert("Server error, try after some time")});
    if(flag)
    {
      changeFlag(false);
    }
    else 
      changeFlag(true);
  }

    return(
        <div className="App">
        <div> 
        <nav  className="navbar navbar-light bg-light">
          <div className="container-fluid" id="header">
            <ul className="nav navbar me-auto mb-2 mb-lg-0">
            <li>
              <img src={logo} alt={logo2}  className="nav-item logo"/>
            </li>
            <li className="nav-item">
                <Link to="/customer_home" className="navbar-brand" id="item">Home</Link>
              </li>
              <li className="nav-item">
                <Link to="services" className="navbar-brand" id="item">Services</Link>
              </li>
              <li className="nav-item">
                <Link to="mybooking" className="navbar-brand" id="item">Mybookings</Link>
              </li>
              <li className="nav-item">
                <Link to="/logout" className="navbar-brand" id="item">Logout</Link>
              </li>
              <Dropdown>  
                <Dropdown.Toggle variant="none" id="dropdown-basic" className="navbar-brand">Category</Dropdown.Toggle>  
                <Dropdown.Menu>  
                  <Dropdown.Item  onClick={()=>handlecurrnt("home")} className="navbar-brand" >Home cleaning</Dropdown.Item>  
                  <Dropdown.Item onClick={()=>handlecurrnt("kitchen")} className="navbar-brand">Kitchen cleaning</Dropdown.Item>  
                  <Dropdown.Item onClick={()=>handlecurrnt("bathroom")} className="navbar-brand">Bathroom cleanning</Dropdown.Item>  
                <Dropdown.Item onClick={()=>handlecurrnt("washroom")} className="navbar-brand">Washroom cleaning</Dropdown.Item>  
                </Dropdown.Menu>  
              </Dropdown>  
            </ul>
          </div>
        </nav>
        <table style={{display:flag?"block":"none"}}>
        <thead>
            <tr>
                <th className="td" width="200" hight="400">S_Id</th>
                <th className="td" width="200" hight="400">Name</th>
                <th className="td"  width="200" hight="400">Description</th>
                <th className="td"  width="200" hight="400">Duration</th>
                <th className="td"  width="200" hight="400">Cost</th>
                <th className="td"  width="200" hight="400">Sp_id</th>
               
            </tr>
        </thead>
        <tbody>
        {
            Data.map(s => {return <tr>
                <td className="td">{s.s_id}</td>
                <td className="td">{s.s_name}</td>
                <td className="td">{s.description}</td>
                <td className="td">{s.duration}</td>
                <td className="td">{s.cost}</td>
                <td className="td">{s.sp_id.name}</td>
            </tr>})
        }
        </tbody>
        </table>
        </div>
        <Outlet />
        </div> 
    )
}
export default CustomerHome;