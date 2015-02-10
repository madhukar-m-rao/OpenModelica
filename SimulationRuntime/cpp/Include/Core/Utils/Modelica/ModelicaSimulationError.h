#pragma once

//Enum for error types that can occur
enum SIMULATION_ERROR {
                      SOLVER, //all errors occur in solver (Euler,CVode)
                      ALGLOOP_SOLVER, //all errors occur in non-,lin-solver (Kinsol,Newton,Hybrj)
                      MODEL_EQ_SYSTEM, //all errors occur in model system class during simulation
                      ALGLOOP_EQ_SYSTEM,//all errors occur in algloop system class during simulation
                      MODEL_FACTORY, //all errors occur model system factory classes
                      SIMMANAGER,//all errors occur in simulation manager
                      EVENT_HANDLING,//all errors occur during event handling
                      TIME_EVENTS, //all errors occur during handling time events
                      DATASTORAGE , //all errors occur during write data (TextfileWriter,MatfileWriter,BufferReaderWriter
                      UTILITY,//all errors occur in utility functions
                      MODEL_ARRAY_FUNCTION,//all errors occur in array functions
                      MATH_FUNCTION //all errors occur in math functions
                      };

/*
Exception class for all simulation errors
*/
class ModelicaSimulationError: public std::runtime_error
 {
   public:
   ModelicaSimulationError(SIMULATION_ERROR error_id,const std::string& error_info)
   :runtime_error(error_info)
   ,_error_id(error_id)
   {
   }
   const char* what()
   {
      std::stringstream ss;
      ss << "simulation error message : " << std::runtime_error::what();
      return ss.str().c_str();
   }
  SIMULATION_ERROR getErrorID()
  {
     return _error_id;
  }
  private:
  SIMULATION_ERROR _error_id;

 };

 //Helper functions to convert the error id to a readable format
 string BOOST_EXTENSION_EXPORT_DECL error_id_string(SIMULATION_ERROR id);
 //Helper functions to extend an error information for new additional string and time stamp
 string BOOST_EXTENSION_EXPORT_DECL add_error_info(string new_info,string info,SIMULATION_ERROR id,double& time);
 //Helper functions to extend an error information for new additional string
 string BOOST_EXTENSION_EXPORT_DECL add_error_info(string new_info,string info,SIMULATION_ERROR id);