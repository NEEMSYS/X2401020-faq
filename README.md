# X2401020-faq

## Vivado F.A.Q 
- 为什么我在vivado中**Behavioral Simulation**和**Post-Implementation Timing Simulation**的波形没有差别？
 
  在vivado中进后实现时序仿真时，需要在TestBench仿真文件中对设计文件的Top module进行实例化仿真，才能出现时序信息。

- verilog的inout接口使用时需要注意哪些事项？

  （1）首先inout必须是wire类型；（2）inout本质是三态门，如果为in时其值应该为高阻态z；（3）在仿真时需要将其声明为wire，然后通过2个reg以三态的形式进行控制，具体参考本项目inout实例；（4）FPGA内部有三态门，在implementation时inout用的就是三态门；（5）在使用inout时需要注意信号冲突，比如我们用basys3的拨码开关sw1作为inout，由于拨码开关本来是用于输入的，要么在低电平，要么在高电平。如果sw1在底电平档位，而sw1作为输出输出了高电平，这种情况如果不慎会导致短路。不过查看Basys3的拨码开关原理图，可知在其引脚处串联了一个10k的电阻，那么这样一来就不会出现直接短路的情况了。

  
