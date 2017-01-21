import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

public class Index extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException {
      String message = System.getenv("POWERED_BY");
      if (message == null) {
          message = "Deis";
      }

      String release = System.getenv("WORKFLOW_RELEASE");
      if (release == null) {
          release = "unknown";
      }

      String container = "unknown";
      Process proc = Runtime.getRuntime().exec("hostname");
      InputStream is = proc.getInputStream();
      Scanner s = new Scanner(is);
      if (s.hasNext()) {
        container = s.next();
      }

      resp.getWriter().print(String.format("Powered by %s\nRelease %s on %s\n", message, release, container));
  }
}
