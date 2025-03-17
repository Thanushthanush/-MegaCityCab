package com.megacitycab.model;

public class Places {
    private int id;
    private String placeName;

    // Constructor
    public Places(int id, String placeName) {
        this.id = id;
        this.placeName = placeName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }
}
