import { useReducer } from "react";

export default function AdminRegistration() {

    const init = {
       
        fname: {value:"", hasError: true,touched: false, error:""},
        lname: {value:"", hasError: true,touched: false, error:""},
        email: {value:"", hasError: true,touched: false, error:""},
        contact: {value:"", hasError: true,touched: false, error:""},
        password: {value:"", hasError: true,touched: false, error:""},
        address: {value:"", hasError: true,touched: false, error:""}
         
    }

    const reducer = (state,action) => {
        
        switch(action.type){
            case 'update' : {
                const {name,value,hasError, error, touched, isFormValid} = action.data;
                return { 
                    ...state,
                    [name]: { ...state[name],value, hasError, error, touched},
                    isFormValid
                }   
            }
            case 'reset' : {
                return init;
            }
        }
    }


    const handleChange = (name,value) => {
          const {hasError, error}= validate(name,value);
          let isFormValid = true;
          
          for(let key in state)  
          {
             if(state[key].hasError === true)
             {
                 isFormValid = false;
                 break;   
             }
          } 
          
          dispatch({type:'update',data:{name,value,hasError,error, touched:true,isFormValid}})
    }


    const validate = (name,value) => {
        let hasError=false;
        let error="";
        switch(name)
        {
             
            case 'fname':
                var re1 = /^[A-Za-z\s]+$/;
                if(!re1.test(value))
                {
                    hasError = true;
                    error = "Invalid First Name";
                }
                break;
            case 'lname':
                var re2 = /^[A-Za-z\s]+$/;
                if(!re2.test(value))
                {
                    hasError = true;
                    error = "Invalid Last Name"
                }
                break;
            case 'email':
                var re3 = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if(!re3.test(value))
                {
                    hasError = true;
                    error = "Invalid Email";
                }
                break;

            case 'contact':
                var re4 = /^[1-9][0-9]{9}$/;
                if(!re4.test(value))
                {
                    hasError = true;
                    error = "Invalid Mobile no";
                }
                break;

            case 'password':
                var re5 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,12}$/;
                if(!re5.test(value))
                {
                    hasError = true;
                    error = "Invalid Password";
                }
                break;
         
        }
        return {hasError, error}
    }
    const sendData=(e)=>{
        e.preventDefault();
        const reqOption={
            method:"post",
            headers:{'content-type':'application/json'},
            body:JSON.stringify({f_name:state.fname.value,l_name:state.lname.value,email:state.email.value,contact:state.contact.value,password:state.password.value,address:state.address.value})
        }
        fetch("http://localhost:8080/regcustomer",reqOption )
        .then(resp=>{
            if(resp.ok)
                return resp.text();
            else
                throw new Error("Server error");
        })
        .catch((error)=>{alert("Server error, try after some time")});

    }


    const [state,dispatch] = useReducer(reducer,init);

    return (<div>
        
        <form>
            <div className="mb-3">
                <label htmlFor="fname" className="form-label">First Name : </label>
                    <input type="text" name="fname"className="form-control" id="fname" value={state.fname.value} onChange={(e)=>{handleChange("fname",e.target.value)}} />
                    <p style={{display: state.fname.touched && state.fname.hasError ?"block":"none",color: "red"}}> {state.fname.error} </p>
            </div>

            <div className="mb-3">
                <label htmlFor="lname" className="form-label">Last Name : </label>
                    <input type="text" name="lname" className="form-control" id="lname" value={state.lname.value} onChange={(e)=>{handleChange("lname",e.target.value)}} />
                    <p style={{display: state.lname.touched && state.lname.hasError ?"block":"none",color: "red"}}> {state.lname.error} </p>
            </div>

            <div className="mb-3">
                <label htmlFor="email" className="form-label">Email Id : </label>
                    <input type="text" name="email" className="form-control" id="email" value={state.email.value} onChange={(e)=>{handleChange("email",e.target.value)}} />
                    <p style={{display: state.lname.touched && state.email.hasError ?"block":"none",color: "red"}}> {state.email.error} </p>
            </div>

            <div className="mb-3">
                <label htmlFor="contact" className="form-label">Contact No. : </label>
                    <input type="text" name="contact" className="form-control" id="contact" value={state.contact.value} onChange={(e)=>{handleChange("contact",e.target.value)}} />
                    <p style={{display: state.contact.touched && state.contact.hasError ?"block":"none",color: "red"}}> {state.contact.error} </p>
            </div>

            <div className="mb-3">
                <label htmlFor="password" className="form-label">Password. : </label>
                    <input type="text" name="password" className="form-control" id="password" value={state.password.value} onChange={(e)=>{handleChange("password",e.target.value)}} />
                    <p style={{display: state.password.touched && state.password.hasError ?"block":"none",color: "red"}}> {state.password.error} </p>
            </div>

            <div className="mb-3">
                <label htmlFor="address" className="form-label">Address. : </label>
                    <input type="text" name="address" className="form-control" id="address" value={state.address.value} onChange={(e)=>{handleChange("address",e.target.value)}} />
                    <p style={{display: state.address.touched && state.address.hasError ?"block":"none",color: "red"}}> {state.address.error} </p>
            </div>

            <div className="col-12">
                        <button type="submit" className="btn btn-primary mb-3" onClick={(e)=>{sendData(e)}}>Submit</button>
                        <button type="reset" className="btn btn-primary mb-3" onClick={()=>{dispatch({type:"reset"} )}}>Reset</button>
            </div>
     

        </form>
         
    </div>)
}