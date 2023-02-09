package data;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class CoordinatesList {
    private List<Coordinates> collection = new LinkedList<>();
    public void add(Coordinates dot){
        collection.add(dot);
    }
    public void clear(){
        collection.clear();
    }
    public List<Coordinates> getCollection(){
        return collection;
    }
    public boolean isEmpty(){
        return collection.size()==0;
    }
}
