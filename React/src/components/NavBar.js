import logo from '../images/logo.jpg';
import logo2 from '../logo2.svg'
import {useSelector} from 'react-redux';
import '../App.css';
import {Link} from 'react-router-dom';
import {Routes, Route} from 'react-router-dom';
import Login from './Login';
import CustomerHome from './CustomerHome';
import ServiceProviderHome from './ServiceProviderHome';
import AdminHome from './AdminHome';
import Logout from './Logout';
import CustomerRegistration from './CustomerRegistration';
import ServiceProviderRegistration from './ServiceProviderRegistration';
import Home from './Home';
import ServiceProviderRegistrationStatus from './ServiceProviderRegistraionStatus';
import Services from './Services';
import BookingCart from './BookingCart';
export default function NavBar()
{
    const mystate=useSelector((state)=>{return state.logged})
    return(
      <div className="App">
      <div style={{display: mystate.loggedIn? "none":"block"}}> 
      <nav  className="navbar navbar-light" id="header">
        <div className="container-fluid">
          <ul className="nav navbar me-auto mb-2 mb-lg-0">
          <li className="nav-item">
              <img src={logo} alt={logo2} className="logo"/>
            </li>
            <li className="nav-item">
              <Link to="/home" className="navbar-brand" id="item">Home</Link>
            </li>
            <li className="nav-item">
                <Link to="/lopcation" className="navbar-brand" id="item">Location</Link>
              </li>
              <li className="nav-item">
                <Link to="/services" className="navbar-brand" id="item">Services</Link>
              </li>
            <li className="nav-item">
              <Link to="/login" className="navbar-brand" id="item">Login</Link>
            </li>
            <li className="nav-item">
              <Link to="/customer_registration" className="navbar-brand" id="item">CustomerRegistration</Link>
            </li>
            <li className="nav-item">
              <Link to="/serviceprovider_registration" className="navbar-brand" id="item">ServiceProviderRegistration</Link>
            </li>
          </ul>
        </div>
      </nav>
      </div>
      <Routes>
        <Route path="/home" element={<Home/>} />
        <Route path="/login" element={<Login/>} />
        <Route path="/customer_registration" element={<CustomerRegistration/>} />
        <Route path="/serviceprovider_registration" element={<ServiceProviderRegistration/>} />
        <Route path="/customer_home" element={<CustomerHome/>} >
              <Route path="services" element={<Services/>} />
        </Route>
        <Route path="/services" element={<Services/>}/>
        <Route path="/serviceprovider_home" element={<ServiceProviderHome/>} >
          <Route path="services" element={<Services/>} />
        </Route>
        <Route path="/admin_home" element={<AdminHome/>} >
            <Route path="serviceproviderstatus" element={< ServiceProviderRegistrationStatus/>}/>
            <Route path="services" element={<Services/>} />
        </Route>
        <Route path="/logout" element={<Logout/>} />
        <Route path="/mybooking" element={<BookingCart/>} />

      </Routes>
      </div>
    
  )}