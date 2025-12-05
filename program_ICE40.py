import subprocess,time

def control_pin(command, pin, state):
    subprocess.run(["pinctrl", command, pin, state]);
    time.sleep(1);

control_pin("set", "25", "op");
control_pin("set","25","dl");
control_pin("set", "24", "op");
subprocess.run(["dd","if=/dev/zero","of=image","bs=2M","count=1"]);
subprocess.run(["dd","if=and_port.bin","conv=notrunc","of=image"]);
subprocess.run(["flashrom", "-p", "linux_spi:dev=/dev/spidev0.0,spispeed=20000", "-w", "image"]);
#subprocess.run(["flashrom", "-p", "linux_spi:dev=/dev/spidev0.0,spispeed=20000", "-v", "image"]);
control_pin("set","24","ip");
control_pin("set", "25", "dh");
control_pin("set","25","dl");
