package com.example.restservice.service.forrage;

import com.example.restservice.entity.forrage.ClientForrage;
import com.example.restservice.repository.forrage.ClientForrageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientForrageService {

    @Autowired
    private ClientForrageRepository ClientForrageRepository;

    public List<ClientForrage> getAllClient() {
        return ClientForrageRepository.findAll();
    }

    public ClientForrage getClientById(Integer id){
        return ClientForrageRepository.findById(id).orElse(null);
    }

    public void saveClient(ClientForrage client){
        ClientForrageRepository.save(client);
    }

    public void deleteClient(Integer id){
        ClientForrageRepository.deleteById(id);
    }

  
}