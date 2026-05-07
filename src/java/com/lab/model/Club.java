package com.lab.model;

public class Club {
    private int clubId;
    private String clubName;
    private String description;
    private Integer advisorId; // using Integer to allow null
    private Integer chairpersonId;

    // Helper fields for UI display (gathered via SQL JOINs)
    private String advisorName;
    private String chairpersonName;

    public Club() {}

    public Club(String clubName, String description) {
        this.clubName = clubName;
        this.description = description;
    }

    public int getClubId() { return clubId; }
    public void setClubId(int clubId) { this.clubId = clubId; }

    public String getClubName() { return clubName; }
    public void setClubName(String clubName) { this.clubName = clubName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Integer getAdvisorId() { return advisorId; }
    public void setAdvisorId(Integer advisorId) { this.advisorId = advisorId; }

    public Integer getChairpersonId() { return chairpersonId; }
    public void setChairpersonId(Integer chairpersonId) { this.chairpersonId = chairpersonId; }

    public String getAdvisorName() { return advisorName; }
    public void setAdvisorName(String advisorName) { this.advisorName = advisorName; }

    public String getChairpersonName() { return chairpersonName; }
    public void setChairpersonName(String chairpersonName) { this.chairpersonName = chairpersonName; }
}
