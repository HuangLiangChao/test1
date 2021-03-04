
void del(unsigned int x)
{
    while (--x);
}

int main()
{
    unsigned int *pReg;
	/*初始化时钟*/
    pReg = (unsigned int *)(0x40023800 + 0x30);
    *pReg |= (1 << 5);
    /*配置f引脚模式*/
    pReg = (unsigned int *)(0x40021400 + 0x00);
    /*通用输出模式*/
    *pReg |= (1 << 2 * 9);
	//Reg = (unsigned int *)(0x40021400 + 0x04);
		
    /*设置输出速度*/
    pReg = (unsigned int *)(0x40021400 + 0x08); 
    *pReg |= (3 << 2*9);

    pReg = (unsigned int *)(0x40021400 + 0x18); 


	while(1) {
		/*输出电平*/
        *pReg=(1<<(16+9));
		del(0xFFFFF);
	
		*pReg=(1<<(9));
		del(0xFFFFF);	
	}
	
	//return 0;
}
