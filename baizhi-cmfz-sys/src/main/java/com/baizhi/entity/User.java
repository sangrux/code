package com.baizhi.entity;

/**
 * Created by Administrator on 2017/6/12.
 */
public class User {
    private String id;
    private String salt;
    private String password;
    private String photoPath;
    private String farmington;
    private String nickname;
    private String sex;
    private  Integer province;
    private Integer city;
    private String location;
    private String description;
    private String phone;
    private Guru guru;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getFarmington() {
        return farmington;
    }

    public void setFarmington(String farmington) {
        this.farmington = farmington;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getProvince() {
        return province;
    }

    public void setProvince(Integer province) {
        this.province = province;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Guru getGuru() {
        return guru;
    }

    public void setGuru(Guru guru) {
        this.guru = guru;
    }

    public User() {
        super();
    }

    public User(String id, String salt, String password, String photoPath, String farmington, String nickname, String sex, Integer province, Integer city, String location, String description, String phone, Guru guru) {
        this.id = id;
        this.salt = salt;
        this.password = password;
        this.photoPath = photoPath;
        this.farmington = farmington;
        this.nickname = nickname;
        this.sex = sex;
        this.province = province;
        this.city = city;
        this.location = location;
        this.description = description;
        this.phone = phone;
        this.guru = guru;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", salt='" + salt + '\'' +
                ", password='" + password + '\'' +
                ", photoPath='" + photoPath + '\'' +
                ", farmington='" + farmington + '\'' +
                ", nickname='" + nickname + '\'' +
                ", sex='" + sex + '\'' +
                ", province=" + province +
                ", city=" + city +
                ", location='" + location + '\'' +
                ", description='" + description + '\'' +
                ", phone='" + phone + '\'' +
                ", guru=" + guru +
                '}';
    }
}
