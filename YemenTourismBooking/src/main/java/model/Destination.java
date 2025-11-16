package model;

public class Destination {
    private int destinationId;
    private String name;
    private String description;
    private String imageUrl;
    private boolean featured;
    private String summary; 

    public Destination() {}

    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
}