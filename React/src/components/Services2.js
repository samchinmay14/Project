import {useEffect,useState} from 'react';
import { useNavigate, json } from 'react-router-dom'
import BookingCart from './BookingCart';
export default function Services2()
{
    const navigate = useNavigate();
    const [Data,setData]=useState([]);
    const [message,setMessage]=useState("");



    useEffect(()=>{
        fetch("http://localhost:8080/getAllServices")
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
               
            }
        })
        .catch((error)=>{alert("Server error, try after some time")});
},[])
    var bookings=[];
    const sendService=(s)=>{
        var mybookings=JSON.parse(localStorage.getItem("cart"));
        if(mybookings==null )
        {
            bookings.push(JSON.stringify(s));
            localStorage.setItem("cart",bookings);
            navigate("/admin_home/mybooking")
        }
        else
        {
            bookings.push(JSON.stringify(mybookings));
            bookings.push(JSON.stringify(s));
            localStorage.setItem("cart",JSON.stringify(bookings));
            navigate("/admin_home/mybooking")
            
        }

    }
   
   
     



    return(
        <div className="container w-50" id="centre">
        <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
        <div class="card-header">Header</div>
        <div class="card-body">
          <h5 class="card-title">Primary card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </div>
        </div>)
}