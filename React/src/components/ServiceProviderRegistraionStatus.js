import {useEffect,useState} from 'react';
import {Link} from 'react-router-dom';
 import { useNavigate } from 'react-router-dom'

export default function ServiceProviderRegistrationStatus()
{

   const navigate = useNavigate();
   const [Data,setData]=useState([]);
   
    useEffect(()=>{
            fetch("http://localhost:8080/serviceproviders")
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
                    
                   setData([]);
                   setMessage("No ServiceProvider Available");
                }
                else{
                    setData(obj);
                    setMessage("");
                }
                
                
                
            })
            .catch((error)=>{alert("Server error, try after some time")});
    },[Data])


    const sendData=(e)=>{
      console.log(e)
      fetch("http://localhost:8080/approve?id="+e)
      .then(resp=>{
          if(resp.ok){

              return resp.json();
              
          }
          else
              throw new Error("Server error");
      })
      .then(obj => {
          if(obj)
          {
            //navigate("/admin_home/serviceproviderstatus");
            //window.location.href="serviceproviderstatus";
          }
          else
          {
            
          }
      })
      .catch((error)=>{alert("Server error, try after some time")});
    }

     


    
    const [message,setMessage]=useState("");

    return(<div>
        <table striped bordered hover variant='dark' id="centre">
        <thead>
            <tr>
                <th  className="td" width="200" hight="400">Id</th>
                <th  className="td" width="200" hight="400">Name</th>
                <th  className="td" width="200" hight="400">Contact</th>
                <th  className="td" width="200" hight="400">Address</th>
                <th  className="td" width="200" hight="400">Status</th>
                <th  className="td" width="200" hight="400">Action</th>
            </tr>
        </thead>
        <tbody>
        {
            Data.map(sp => {return <tr>
                <td className="td">{sp.sp_id}</td>
                <td className="td">{sp.name}</td>
                <td className="td">{sp.login_id.contact}</td>
                <td className="td">{sp.login_id.address}</td>
                <td className="td">{JSON.stringify(sp.login_id.status)}</td>
                <td className="td"><button onClick={()=>{sendData(sp.login_id.login_id)}}>Approve</button></td>
                {/*<td><a href={`http://localhost:8080/approve?id=${sp.login_id.login_id}`}> Approve</a></td>*/}
                
                
            </tr>})
        }
        </tbody>
        </table>
        <h1 className="error" id="centre">{message}</h1>
    </div>)
}