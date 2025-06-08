package model;

public class Funcionario {
	private int id;
	private String name;
	private String gender;
	private String email;
	private String senha;
	
	public Funcionario() {
		this(0);
	}
	
	public Funcionario(int id) {
		this.id = id;
		setName("");
		setGender("");
		setEmail("");
		setSenha("");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Override
	public String toString() {
	    return getName();
	}
}
