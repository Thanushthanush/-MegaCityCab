package com.megacitycab.model;

public class TeamMember {
    private String name;
    private String post;
    private String imageUrl;

    public TeamMember() {}

    public TeamMember(String name, String post, String imageUrl) {
        this.name = name;
        this.post = post;
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
