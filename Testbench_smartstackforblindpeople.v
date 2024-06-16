//testbench code of module of smart stick for blindpeople
module tb_dld_project;
  //declaring the output and input varriables of module whose testbench has to be created
   reg clk;
   reg sensorpin1;
   reg sensorpin2;
   reg sensorpin3;
   wire first_sensor_output;
   wire second_sensor_output;
   wire third_sensor_output;
   wire buzzerpin;
  wire d;
  wire q;
  wire q_bar;
  //module calling under uut
  dld_project uut(
    .clk(clk),
    .sensorpin1(sensorpin1),
    .sensorpin2(sensorpin2),
    .sensorpin3(sensorpin3),
    .first_sensor_output(first_sensor_output),
    .second_sensor_output(second_sensor_output),
    .third_sensor_output(third_sensor_output),
    .buzzerpin(buzzerpin),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  // Clock generation
  initial begin
    //seting the clock high for every case because we are working on positive edge of each clock
    clk = 1;
  end
  //all the possible cases for our project
  initial begin
    //case#1
    
     sensorpin1 = 0;
    sensorpin2 = 0;
    sensorpin3 = 0;
    #100;
    
     sensorpin1 = 0;
    sensorpin2 = 0;
    sensorpin3 = 0;
    //case#2
     sensorpin1 = 0;
    sensorpin2 = 0;
    sensorpin3 = 1;
    #100;
    //case#3
     sensorpin1 = 0;
    sensorpin2 = 1;
    sensorpin3 = 0;
 #100;
    //case#4
     sensorpin1 = 0;
    sensorpin2 = 1;
    sensorpin3 = 1;
    #100;
    //case#5
     sensorpin1 = 1;
    sensorpin2 = 0;
    sensorpin3 = 0;
    #100;
    //case#6
     sensorpin1 = 1;
    sensorpin2 = 0;
    sensorpin3 = 1;
    #100;
    //case#7
     sensorpin1 = 1;
    sensorpin2 = 1;
    sensorpin3 = 0;
    #100;
    //case#8
     sensorpin1 = 1;
    sensorpin2 = 1;
    sensorpin3 = 1;
    #100;
    $finish;
  end
//to print the wave and to print the values on monitor screen
      initial 
     begin
       $monitor("clk=%b,sensorpin1 = %b,sensorpin2 = %b,sensorpin3 = %b,first_sensor_output= %b,second_sensor_output = %b,third_sensor_output = %b,d=%b,q=%b,,q_bar=%b,Buzzer = %b",clk,sensorpin1,sensorpin2,sensorpin3,first_sensor_output,second_sensor_output,third_sensor_output,d,q,q_bar, buzzerpin);
     end
  //creating the dumb file to download it after its simulation
   initial 
     begin
        $dumpfile("dump.vcd"); 
      $dumpvars(1);
    end
endmodule
