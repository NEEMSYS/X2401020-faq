# X2401020-faq

## Vivado F.A.Q 
- 为什么我在vivado中**Behavioral Simulation**和**Post-Implementation Timing Simulation**的波形没有差别?
 
  在vivado中进后实现时序仿真时，需要在TestBench仿真文件中对设计文件的Top module进行实例化仿真，才能出现时序信息。
