package model;

public class Cliente {
	private int id;
	private String name;
	private String email;
	private String telefone;
	
	public Cliente() {
		this(0);
	}
	
	public Cliente(int id) {
		this.id = id;
		setName("");
		setEmail("");
		setTelefone("");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	@Override
	public String toString() {
	    return getName();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
