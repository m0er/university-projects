package moer.moerog.config;

import org.springframework.context.annotation.*;
import org.springframework.stereotype.Controller;

@Configuration
@Import(MongoConfig.class)
@ImportResource({"classpath:applicationContext-security.xml"})
@ComponentScan(basePackages="moer.moerog", excludeFilters={@ComponentScan.Filter(Configuration.class), @ComponentScan.Filter(Controller.class)})
public class AppConfig {
}
