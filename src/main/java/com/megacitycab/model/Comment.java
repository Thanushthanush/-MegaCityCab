package com.megacitycab.model;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private int userId;
    private String email;
    private String comment;
    private Timestamp createdAt;

    // Constructor
    public Comment(int id, int userId, String email, String comment, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.email = email;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    // Getter and Setter Methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

}
