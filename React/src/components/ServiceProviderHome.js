import {Link,Outlet} from 'react-router-dom';
import logo2 from '../logo2.svg';
import logo from '../images/logo.jpg';

function ServiceProviderHome()
{

    
     
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
                <Link to="/serviceprovider_home" className="navbar-brand" id="item">Home</Link>
              </li>
              <li className="nav-item">
                <Link to="/serviceprovider_home/services" className="navbar-brand" id="item">Services</Link>
              </li>
              <li className="nav-item">
                <Link to="/serviceprovider_home/myservice" className="navbar-brand" id="item">MyServices</Link>
              </li>
              <li className="nav-item">
                <Link to="/serviceprovider_home/addservice" className="navbar-brand" id="item">Add Services</Link>
              </li>
              <li className="nav-item">
                <Link to="/logout" className="navbar-brand" id="item">Logout</Link>
              </li>
              <li className="nav-item">
              <Link to="/serviceprovider_home/paymentacceptance" className="navbar-brand" id="item">Paymentacceptance</Link>
            </li> 
              
            </ul>
          </div>
        </nav>
        </div>
        <Outlet />
        </div>
         
   )
}
export default ServiceProviderHome;