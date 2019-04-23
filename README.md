# X2401020-faq

## Vivado F.A.Q 
- 为什么我在vivado中**Behavioral Simulation**和**Post-Implementation Timing Simulation**的波形没有差别？
 
  在vivado中进后实现时序仿真时，需要在TestBench仿真文件中对设计文件的Top module进行实例化仿真，才能出现时序信息。

- verilog的inout接口使用时需要注意哪些事项？

  （1）首先inout必须是wire类型；（2）inout本质是三态门，如果为in时其值应该为高阻态z；（3）在仿真时需要将其声明为wire，然后通过2个reg以三态的形式进行控制，具体参考本项目inout实例；（4）FPGA内部有三态门，在implementation时inout用的就是三态门；（5）在使用inout时需要注意信号冲突，比如我们用basys3的拨码开关sw1作为inout，由于拨码开关本来是用于输入的，要么在低电平，要么在高电平。如果sw1在底电平档位，而sw1作为输出输出了高电平，这种情况如果不慎会导致短路。不过查看Basys3的拨码开关原理图，可知在其引脚处串联了一个10k的电阻，那么这样一来就不会出现直接短路的情况了。

- 生成比特流(Bitstream)文件提示出错？
  
  一般比特流文件生成出错主要是由约束文件撰写错误导致，撰写约束文件时请注意：（1）请使用basys3约束文件模版，直接在模版上进行修改；（2）注意约束文件中的端口名要与设计文件顶层文件模块的信号名保持一致，注意区分大小写。

- 仿真波形输出为**z**或者**x**
  
  请检查仿真文件的激励(reg)和输出(wire)信号是否正确连接和赋值。一般这种情况是信号连接错误导致。  

- 使用IP核进行设计，如果设计中存在三态，在**Generate Output Products**时，Systhesis Options选择**Out of context per IP**，查看综合实现后的原理图，三态设计引脚不会映射出三态门？

  （1）Systhesis Options包括Global、Out of context per IP和Out of context per Block Design；（2）Out of context per IP指让vivado在综合的时候对IP进行单独综合，将IP综合的结果生成一个文件（.dcp），然后在工程需要用到IP的时候，只需要从.dcp文件中解析出对应IP的网表文件即可，而不需对IP进行重新综合，这样的方式可以加快综合的速度；（3）Global选项则是每次工程综合的时候，IP核都会和工程一起综合，这样综合的时间就很长，而且Global选项不会产生.dcp文件，因为工程综合的时候是对IP核的源码进行综合的。（3）如果设计中存在三态（高阻态），Out of Contex per IP综合操作就会受到影响，FPGA仅支持I/O输出端口的高阻态，在器件内部是不允许的，如果使用Out of Contex per IP综合方式，Vivado工具并不知道某个具体的信号是连接I/O输出还是在器件内部进行连接，最后，综合工具会将这个高阻信号转换为某个逻辑值，而不是最为高阻态进行综合。（4）解决办法：综合方式选择Global