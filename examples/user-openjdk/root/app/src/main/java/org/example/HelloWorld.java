import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;

public class HelloWorld {
    public static void main(String[] args) throws Exception{
        String portEnv = System.getenv("PORT");
        int port = 5000;
        if (portEnv != null) {
            port = Integer.valueOf(portEnv);
        }

        Server server = new Server(port);
        ServletContextHandler context = new ServletContextHandler(ServletContextHandler.SESSIONS);
        context.setContextPath("/");
        server.setHandler(context);
        context.addServlet(new ServletHolder(new Healthcheck()),"/healthz");
        context.addServlet(new ServletHolder(new Index()),"/*");
        server.start();
        server.join();
    }
}
