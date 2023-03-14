import {Link, Outlet} from 'react-router-dom';
import {useState, useImperativeHandle} from 'react';
import {Container , DropdownButton, Dropdown} from 'react-bootstrap';
import logo2 from '../logo2.svg';
import logo from '../images/logo.jpg';
 
import { current } from '@reduxjs/toolkit';

 
function AdminHome()
{

  const [flag,changeFlag]=useState(false);
  const [Data,setData]=useState([]);
  const [message,setMessage]=useState("");


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
    }

    return(
        <div className="App">
        <div> 
        <nav  className="navbar navbar-light bg-light">
          <div className="container-fluid"  id="header">
            <ul className="nav navbar me-auto mb-2 mb-lg-0">
            <li>
              <img src={logo} alt={logo2}  className="nav-item logo"/>
            </li>
            <li className="nav-item">
                <Link to="/admin_home" className="navbar-brand" id="item">Home</Link>
              </li>
              <li className="nav-item">
               
              </li>
              <li className="nav-item">
                <Link to="/admin_home/services" className="navbar-brand" id="item">Services</Link>
              </li>
              
              <li className="nav-item">
                <Link to="/logout" className="navbar-brand" id="item">Logout</Link>
              </li>
              <li className="nav-item">
                <Link to="/admin_home/serviceproviderstatus" className="navbar-brand" id="item">RgistrationStatus</Link>
              </li>
              <Dropdown>  
                <Dropdown.Toggle variant="none" id="dropdown-basic" className="navbar-brand">Category</Dropdown.Toggle>  
                <Dropdown.Menu>  
                  <Dropdown.Item  onClick={()=>handlecurrnt("home")} className="navbar-brand" id="item">Home cleaning</Dropdown.Item>  
                  <Dropdown.Item onClick={()=>handlecurrnt("kitchen")} className="navbar-brand" id="item">Kitchen cleaning</Dropdown.Item>  
                  <Dropdown.Item onClick={()=>handlecurrnt("bathroom")} className="navbar-brand" id="item">Bathroom cleanning</Dropdown.Item>  
                <Dropdown.Item onClick={()=>handlecurrnt("washroom")} className="navbar-brand" id="item">Washroom cleaning</Dropdown.Item>  
                </Dropdown.Menu>  
              </Dropdown>  
            </ul>
          </div>
        </nav>


        <table style={{display:flag?"block":"none"}}>
        <thead>
            <tr>
                <th className="td" width="200" hight="400">S_Id</th>
                <th className="td"  width="200" hight="400">Name</th>
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
export default AdminHome;