NAME:=RISCY
PROJECT:=arty

all:
	vivado -mode batch -source recreate.tcl
#  ./postsynth_names.py

gui:
	vivado -mode gui -source recreate.tcl &

clean:
	rm -rf ${PROJECT}.xpr
	rm -rf ${PROJECT}.data
	rm -rf ${PROJECT}.runs
	rm -rf ${PROJECT}.srcs
	rm -rf ${PROJECT}.sim
	rm -rf ${PROJECT}.cache
	rm -rf ${PROJECT}.ioplanning
	rm -rf ${PROJECT}.hw
	rm -rf ${PROJECT}.ip_user_files
	rm -rf component.xml
	rm -rf vivado*
	rm -rf .Xil
	rm -rf xgui
#	rm -rf ${PROJECT}.edn
#	rm -rf ${PROJECT}_stub.v
#	rm -rf ${PROJECT}_funcsim.v
