run:
	@processing-java --sketch=PerlinNoiseFlowField --run

build:
	@processing-java --sketch=PerlinNoiseFlowField --output=build --export

install: build
	@mkdir -p /usr/share/PerlinNoiseFlowField
	@cp -r build/* /usr/share/PerlinNoiseFlowField
	@chmod 755 /usr/share/PerlinNoiseFlowField -R
	@printf "#!/bin/bash\ncd /usr/share/PerlinNoiseFlowField && ./PerlinNoiseFlowField\n" > /usr/bin/PerlinNoiseFlowField
	@chmod 755 /usr/bin/PerlinNoiseFlowField

uninstall:
	@rm -fr /usr/share/PerlinNoiseFlowField
	@rm /usr/bin/PerlinNoiseFlowField

clean:
	@rm -fr build
