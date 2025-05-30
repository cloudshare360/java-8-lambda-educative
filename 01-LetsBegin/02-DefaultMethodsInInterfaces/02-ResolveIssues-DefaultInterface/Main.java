public class Main implements InterfaceA, InterfaceB {
    @Override
     public void printSomething() {
        InterfaceA.super.printSomething();
        InterfaceB.super.printSomething();
    }
    public static void main(String args[])
    {
        Main main = new Main();
        main.printSomething();
    }

}