// module of smart stick for blindpeople
module dld_project(
  //input value of clock signal
  input clk,
  //input values of all three sensors
  input sensorpin1, 
  input sensorpin2,
  input sensorpin3,
  //high and low values from sensors on detecting objects
  
  //three sensors will give three outputs
  output reg first_sensor_output,
  output reg second_sensor_output,
  output reg third_sensor_output,
  //7432 ics after analyzing values sets  buzzerpin high or low
  output reg buzzerpin,
  // d_flipflop varriable initalization
  output reg d,
    output  q,
  output q_bar
);
  //always block for sensor 1 if sensor1  detects an objects input is set high else it will set low input
always@(sensorpin1)
    begin
      if(sensorpin1==1)
        begin
          first_sensor_output=1;
        end
      else 
        begin
          first_sensor_output=0;
        end
    end
  //always block for sensor 2 if sensor2 has high input it will set 1 else it will set 0
  always@(sensorpin2)
   begin
     if(sensorpin2==1)
        begin
          second_sensor_output=1;
        end
      else 
        begin
          second_sensor_output=0;
        end
   end
  //always block for sensor 3 if sensor3 has high input than 1 will be sent to 7432 ic else it will send 0
  always@(sensorpin3)
   begin
     if(sensorpin3==1)
        begin
          third_sensor_output=1;
        end
 else 
        begin
          third_sensor_output=0;
        end
     end
  //always block to analyze data coming from sensors and setting value of d in d_flipflop value high or low depending on recieved data
  always@(first_sensor_output,second_sensor_output,third_sensor_output)   begin
   if(first_sensor_output==1 || second_sensor_output==1 || third_sensor_output==1)
        begin
          d=1;
        end
      else 
        begin
          d=0;
        end
     end
  //var1 and var2 to store temporaray data
  wire var1,var2;
  //implementation of d_flipflop
  assign var1 = ~(d & clk);
  assign var2 = ~(~d & clk);

  assign q = ~(var1 & q_bar);
  assign q_bar = ~(var2 & q);
  //setting the value of buzzer high and low depending on the q_flipflop output of q
  always@(q,posedge clk)
    begin
      if(q==1)
        begin
          buzzerpin=1;
        end
      else 
        begin
          buzzerpin=0;
        end
     end
endmodule
