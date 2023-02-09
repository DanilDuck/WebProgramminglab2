package data;

public class Coordinates {
    Double x, y, r;
    private final String currentTime;
    private final Long executionTime;
    private final boolean hitFact;
    public Coordinates(double x, double y, double r, String current, Long execution, boolean res){
        this.x = x;
        this.y = y;
        this.r = r;
        this.currentTime = current;
        this.executionTime = execution;
        hitFact = res;
    }
    public Double getR() {
        return r;
    }

    public Double getX() {
        return x;
    }

    public Double getY() {
        return y;
    }
    public String getCurrentTime() {
        return currentTime;
    }

    public Long getExecutionTime() {
        return executionTime;
    }
    public boolean getHitFact() {
        return hitFact;
    }

    @Override
    public String toString() {
        if(x != null) {
            String hit = getHitFact() ? "YOU HIT" : "YOU MISS";
            return hit + "  x: " + x + " y: " + y + " r: " + r;
        }else {
            return "Set the coordinates";
        }
    }
    public void clear(){
        x = null;
        y = null;
        r = null;
    }
}
