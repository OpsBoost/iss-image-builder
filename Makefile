test:
	./tests/install_bash_unit.sh
	./bash_unit
	./bash_unit tests/test_image-builder.sh
