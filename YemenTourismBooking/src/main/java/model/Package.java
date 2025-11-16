package model;

public class Package {
    private int packageId;
    private int destinationId;
    private String name;
    private String description;
    private java.math.BigDecimal price;

    public Package() {}

    public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }

    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public java.math.BigDecimal getPrice() { return price; }
    public void setPrice(java.math.BigDecimal price) { this.price = price; }
}