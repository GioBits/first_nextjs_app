import { auth, signOut } from "@/auth";
import { Button } from "@/components/ui/button";
import ROUTES from "../constants/route";

const Home = async () => {
  const session = await auth();
  console.log("Session on Home page:", session);
  return (
    <div>
      <h1 className="h1-bold">Welcome to the Home Page</h1>
      <form
        action={async () => {
          "use server";
          await signOut({ redirectTo: ROUTES.SIGN_IN });
        }}
        className="px-10 pt-[100px]"
      >
        <Button type="submit">Log out</Button>
      </form>
    </div>
  );
};

export default Home;
